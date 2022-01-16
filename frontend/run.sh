robot -l NONE -o NONE -r NONE tasks/Delorean.robot
# robot -d ./logs tests/AttemptBeGeek.robot
# robot -d ./logs -i login_success -v BROWSER:chromium -v HEADLESS:True tests/Login

# Paralelizando seus testes usando o pabot
pabot -x xunit.xml -d ./logs -v BROWSER:chromium -v HEADLESS:True tests


rm -rf ./logs/browser
mkdir ./logs/browser
mkdir ./logs/browser/screenshot

cp $(find ./logs/pabot_results -type f -name "*.png")  ./logs/browser/screenshot/