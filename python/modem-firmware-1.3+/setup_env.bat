@echo off
SETLOCAL

:: Check if Python is installed
python --version >nul 2>&1
IF ERRORLEVEL 1 (
    echo Python is not installed. Please install Python and try again.
    EXIT /B 1
)

:: Create virtual environment
echo Creating virtual environment...
pip install virtualenv
python -m venv venv

:: Activate virtual environment
echo Activating virtual environment...
CALL venv\Scripts\activate

:: Install requirements if the requirements.txt file exists
IF EXIST requirements.txt (
    echo Installing requirements from requirements.txt...
    pip install -r requirements.txt
) ELSE (
    echo requirements.txt file not found. Skipping pip install.
)

echo Setup complete. Virtual environment initialized.

python create_ca_cert.py -c US -f self_

echo Generated CA_CERTS

ENDLOCAL
pause
