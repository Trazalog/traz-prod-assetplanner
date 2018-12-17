A verificar en la instalación del producto:


Verificar que el modulo de rewrite esta instalado
httpd -M

Debe figurar asi:
rewrite_module (shared)


Ademas verificar en el archivo
/etc/httpd/conf/httpd.conf
Que AllowOverride sea All par el directorio html

. . .
<Directory /var/www/html>
. . .
 # 
 # AllowOverride controls what directives may be placed in .htaccess files.
 # It can be "All", "None", or any combination of the keywords:
 # Options FileInfo AuthConfig Limit
 #
 AllowOverride All
. . .
</Directory>
. . .

Reiniciar apache

systemctl restart httpd
