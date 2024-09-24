
from flask import Flask, request, session
import requests

from twilio.twiml.messaging_response import MessagingResponse
from datetime import datetime,timedelta,timezone
import traceback

SECRET_KEY = 'gcalbot2024'
app = Flask(__name__)
app.config.from_object(__name__)
SERVER="10.142.0.13:8280"
API_URL = f"http://{SERVER}"


def obtener_datos_equipo(equi_id):
    try:
        print(f"obteniendo datos equ de {equi_id}")
        # Get equipment details from RESTful service
        headers = {'Accept': 'application/json'}

        equi_url = f"{API_URL}/services/MANDataService/equipo/{equi_id}"
        print(f"equi url {equi_url}")
        equipment_response = requests.get(equi_url,headers=headers)
        
        if equipment_response.status_code == 200:
            tx =equipment_response.text
            print(f"Eq recibido ok {tx}")

            equipo_info = equipment_response.json().get('equipo', {})  # Get the 'equipo' element

            return equipo_info
        else:
            print(f" Error http -> {equipment_response.status_code}")
            return
        
    except (Exception) as error:
        print(traceback.format_exc())
        print("Error al invocar al servicio:", error)
        return None
    
def obtener_datos_usuario(from_number):
    try:
        print(f"obteniendo datos usr de {from_number}") 

        headers = {'Accept': 'application/json'}

        # Get equipment details from RESTful service
        user_url = f"{API_URL}/services/COREDataService/usuario/porTelefono/{from_number.replace("whatsapp:+", "")}"
        print(f"url {user_url}")
        user_response = requests.get(user_url,headers=headers)
        
        if user_response.status_code == 200:
            tx = user_response.text
            print(f"Usr recibido ok {tx}")

            user_info = user_response.json().get('usuario', {})  # Get the 'usuario' element

            return  user_info
        else:
            print(f" Error http -> {user_response.status_code}")
            return
        
    except (Exception) as error:
        print(traceback.format_exc())
        print("Error al invocar al servicio:", error)
        return None
    
    
# converts a given number to emoji      t
def number_to_emoji(num):
    if num == 10:
        return "1️⃣0️⃣"  # Concatenated emojis for 1 and 0
    elif num == 11:
        return "1️⃣1️⃣"  # Concatenated emojis for 1 and 1    
    elif 0 <= num <= 9:
        return f"{num}\uFE0F\u20E3"  # Keycap emoji format for numbers 1 to 9
    else:
        return "Number must be between 0 and 10."
def round_to_next_half_hour(dt):
    # Calculate the number of minutes to add to reach the next half-hour
    if dt.minute < 30:
        # Round up to the next half-hour
        dt = dt.replace(minute=30, second=0, microsecond=0)
    else:
        # Round up to the next hour
        dt = dt.replace(hour=dt.hour + 1, minute=0, second=0, microsecond=0)
    
    return dt

#la siguiente se dispara desde el global webhook. El tema es que el request.form tiene un formato distinto de que viene desde messaging. Creo que tenemos que usar el 
#de messaging, se adapta mas a nuestro caso de uso
@app.route("/solServWebHook", methods=["POST"])
def webhook():
    try:
        # Extraer el mensaje entrante y el número del remitente
        incoming_msg = request.form.get("Body")
        from_number = request.form.get("From")
        print(f"Received message '{incoming_msg}' from {from_number}")

        # Crear una respuesta de Twilio
        resp = MessagingResponse()
        
        step = int(session.get('step'+str(from_number), 0))
        print(f"Session step is {step}")

        if step == 0:
            equi_id=incoming_msg
            session['equi_id'+str(from_number)] = incoming_msg

            datos_equipo = obtener_datos_equipo(equi_id)  
            session['datos_equipo'+str(from_number)] = datos_equipo

            if datos_equipo:                    
                equi_description = datos_equipo['descripcion']
                equi_codigo = datos_equipo['codigo']
                equi_estado = datos_equipo['estado']    
                equi_empresa = datos_equipo['empresa']   
                equi_marca = datos_equipo['marca']      
                equi_sector = datos_equipo['sector']     
                equi_grupo = datos_equipo['grupo']     
                equi_criticidad = datos_equipo['criticidad']
                equi_area = datos_equipo['area']       
                equi_proceso = datos_equipo['proceso']  
                equi_empr_id = datos_equipo['empr_id']
            else:
                resp.message("Id de equipo desconocido")
                return str(resp)
    
            datos_usuario= obtener_datos_usuario(from_number) 
            session['datos_usuario'+str(from_number)] = datos_usuario
    
            if datos_usuario:
                user_id= datos_usuario['user_id'],
                user_ult_login = datos_usuario['ultimo_login'],
                user_estado=datos_usuario['estado'],
                user_es_baneado=datos_usuario['es_baneado'],
                user_documento=datos_usuario['documento'],
                user_imagen=datos_usuario['imagen'],
                user_deposito=datos_usuario['deposito'],
                user_nombre=datos_usuario['nombre'],
                user_nick=datos_usuario['nick'],
                user_rol_seguridad=datos_usuario['rol_seguridad'],
                user_correo=datos_usuario['correo'],
                user_apellido=datos_usuario['apellido'],
                user_telefono=datos_usuario['telefono'],
                user_depo_id=datos_usuario['depo_id']
            else:
                resp.message("Id de usuario desconocido")
                return str(resp)

            
            resp.message(f"Bienvenido a Trazalog Tools Mantenimiento. *{user_nombre} {user_apellido}* - email: *{user_correo}*\n"+ 
                         f"Vamos a ingresar una solicitud de Reparación para el equipo *{equi_codigo}-{equi_description}* 👩🏻‍🏫\n"+
                         f"Empresa:{equi_empresa} - Marca: {equi_marca} - Sector {equi_sector} - Grupo {equi_grupo} - Area: {equi_area} - Crit: {equi_criticidad} - Proc: {equi_proceso}\n"+
                        "Por favor ingrese la falla detectada: 🪪🙏\n")
        elif step == 1:
            datos_equipo = None
            datos_usuario = None
            session['falla'+str(from_number)] = incoming_msg
            resp.message("Por favor ingrese una foto: 🪪🙏")
        elif step == 2:
            print("Preparando para crear issue")
            equi_id = int(session.get('equi_id'+str(from_number), 0))

            datos_equipo = session.get('datos_equipo'+str(from_number), 0)
            datos_usuario = session.get('datos_usuario'+str(from_number), 0)

            if datos_equipo:
                equi_empr_id = datos_equipo['empr_id']
                print(f"empr  {equi_empr_id}")

            else:
                resp.message("Id de equipo desconocido")
                return str(resp)
            
            if datos_usuario:
                user_id= datos_usuario['user_id']
                user_nombre=datos_usuario['nombre']
                user_apellido=datos_usuario['apellido']
                print(f"user  {user_id}")
            else:
                resp.message("Id de usuario desconocido")
                return str(resp)

            session['foto'+str(from_number)] = incoming_msg       
            foto=incoming_msg     
            falla=session.get('falla'+str(from_number),0)
            headers = {'Accept': 'application/json'}
            params = {
                        'solicitudServicio':{
                            'fec_solicitud': '2024-02-02 14:30:22'
                            ,'equi_id':f'{equi_id}'
                            ,'estado':'S'
                            ,'user_id':f'{user_id}'
                            ,'solicitante':f'{user_nombre}'
                            ,'causa':f'{falla}'
                            ,'foto':f'{foto}'
                            ,'empr_id':f'{equi_empr_id}'
                            }
                        }
            print (f"params son {params}")
            post_url = f"{API_URL}/tools/man/solicitudServicio?bpmSession="
            print(f"About to send to {post_url}")
            try:
                # Call the POST API to create the issue with the failure description
                issue_response = requests.post(
                    post_url, 
                    params=params, headers=headers
                    )
            
           
                if issue_response.status_code == 200:
                    issue_data = issue_response.json()
                    issue_id = issue_data['sose_id']
                    
                    # Respond with the issue ID to the user
                    response_message = f"Su incidente fue creado satisfactoriamente con el identificador {issue_id}."
                else:
                    print(f"Error al crear issue {issue_response.status_code}")
                    print(f"cuerpo {issue_response.text}")
                    resp.message(f"Error al crear issue {issue_response.status_code}")
                    step=-1
            except requests.exceptions.RequestException as e:  # This is the correct syntax
                print(traceback.format_exc())
                print(f"cuerpo {issue_response.text}")
                resp.message(f"Fatal error al crear issue {issue_response.status_code}")
                step=-1
            
        else:
            step=-1
        step +=1
        print(f"setting step {step}")
        session['step'+str(from_number)] = str(step)
        return str(resp)
    except Exception as e:
        step=0
        print(f"Error, reseting step {step}")
        print(traceback.format_exc())
        session['step'+str(from_number)] = str(step)
        session['equi_id'+str(from_number)] = 0
        return "Error"
if __name__ == '__main__':
    app.run(debug=True, port=3000)