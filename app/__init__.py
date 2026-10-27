from flask import Flask

# Flask busca las carpetas templates y static dentro app
app= Flask(__name__)

from app import routes


