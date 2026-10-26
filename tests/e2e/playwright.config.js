// @ts-check
const { defineConfig, devices } = require('@playwright/test');

/**
 * Suite E2E de REQ-ASSET-ALM (fase F6).
 *
 * Config por variables de entorno — ver tests/e2e/README.md:
 *   ASSET_URL   URL base de AssetPlanner (obligatoria)
 *   ASSET_USER / ASSET_PASS   credenciales de un usuario de la empresa de prueba
 *   TOOLS_URL   URL base de traz-tools (opcional; habilita los tests de pantallas de tools)
 */
module.exports = defineConfig({
  testDir: __dirname,
  timeout: 60_000,
  expect: { timeout: 15_000 },
  fullyParallel: false, // la app usa una sola sesión PHP por usuario
  workers: 1,
  retries: process.env.CI ? 1 : 0,
  reporter: [['list'], ['html', { open: 'never', outputFolder: 'playwright-report' }]],
  use: {
    baseURL: process.env.ASSET_URL,
    trace: 'retain-on-failure',
    screenshot: 'only-on-failure',
    // el video exige el ffmpeg de Playwright (`npx playwright install ffmpeg`);
    // se habilita con E2E_VIDEO=1 para no romper instalaciones mínimas
    video: process.env.E2E_VIDEO ? 'retain-on-failure' : 'off',
    ignoreHTTPSErrors: true,
    actionTimeout: 15_000,
  },
  projects: [
    {
      name: 'chromium',
      use: {
        ...devices['Desktop Chrome'],
        // usa el Chrome del sistema si no se descargaron los browsers de Playwright
        channel: process.env.PW_CHANNEL || undefined,
      },
    },
  ],
});
