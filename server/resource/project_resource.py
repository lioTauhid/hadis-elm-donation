from flask import request
from flask_restful import Resource

from db import db
from model.project import ProjectModel


class Project(Resource):
    def get(self, id):
        return ProjectModel.query.filter_by(id=id).first().to_json()

    def put(self, id):
        project = ProjectModel.query.filter_by(id=id).first()
        project.name = request.form['name']
        project.title = request.form['title']
        project.description = request.form['description']
        project.need_amount = request.form['need_amount']
        project.zakat = request.form['zakat']
        project.fund = request.form['fund']
        project.image_path = request.form['image_path']
        db.session.add(project)
        db.session.commit()
        return {"message": "Item updated successfully"}

    def delete(self, id):
        project = ProjectModel.query.filter_by(id=id).first()
        db.session.delete(project)
        db.session.commit()
        return {"message": "Item deleted successfully"}


class Projects(Resource):
    def get(self):
        dataList = ProjectModel.query.all()
        projectList = []
        for project in dataList:
            projectList.append(project.to_json())

        return projectList

    def post(self):
        req = request.form
        db.session.add(
            ProjectModel(req['name'], req['title'], req['description'], req['need_amount'], req['zakat'], req['fund'],
                         req['image_path']))
        db.session.commit()
        return {"message": "Item added successfully"}
