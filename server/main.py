from flask import Flask
from flask_restful import Api
from db import db
from resource.project_resource import Project, Projects
from resource.transfer_resource import Transfers, Transfer

app = Flask(__name__)
api = Api(app)
app.config['MAX_CONTENT_LENGTH'] = 16 * 1024 * 1024
# app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://ateerashp_elm:MW=!BEzocOBV@139.162.33.238:3306/ateerashp_ELM'
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://ateerashp_elm:MW=!BEzocOBV@127.0.0.1/ateerashp_ELM'
app.config['SECRET_KEY'] = "secret string"
WEB_APP_DIR = 'templates'

api.add_resource(Project, "/project/<int:id>")
api.add_resource(Projects, "/projects")

api.add_resource(Transfer, "/transfer/<int:id>")
api.add_resource(Transfers, "/transfers")

db.init_app(app)

if __name__ == '__main__':
    # app.run(port=80, debug=True)
    app.run(debug=True)
