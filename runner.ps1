# Download Webdriver.dll -> Unzip NuGet pachage
# https://www.nuget.org/packages/Selenium.WebDriver

# Download Chromedriver 
# https://googlechromelabs.github.io/chrome-for-testing/#stable

# Install-Module -Name Selenium -Scope CurrentUser

Add-Type -Path ".\selenium\WebDriver.dll"
$driverPath = ".\selenium\chromedriver.exe"

# Configura as opções do Chrome
$options = New-Object OpenQA.Selenium.Chrome.ChromeOptions
# $options.AddArgument("--headless")             # Configura o navegador para headless
# $options.AddArgument("--disable-gpu")          # Desabilita a GPU para headless

$credentials = "admin:admin"



# Inicializa o WebDriver do Chrome com as opções configuradas
$driver = New-Object OpenQA.Selenium.Chrome.ChromeDriver($driverPath, $options)

# Define o URL que você deseja abrir
$url = "https://$credentials@the-internet.herokuapp.com/basic_auth"

# Abre o navegador e navega para o URL especificado
$driver.Navigate().GoToUrl($url)

Write-Host $driver.Title

# Exemplo: aguarda 5 segundos e depois fecha o navegador
Start-Sleep -Seconds 5
$driver.Quit()

