from flask import request
from flask_restful import Resource

from db import db
from model.gift import Gift
from model.project import ProjectModel
from model.transfer import TransferModel


class Transfer(Resource):
    def get(self, id):
        return TransferModel.query.filter_by(id=id).first().to_json()


class Transfers(Resource):
    def get(self):
        dataList = TransferModel.query.all()
        projectList = []
        for project in dataList:
            projectList.append(project.to_json())
        return projectList

    def post(self):
        req = request.get_json(force=True)
        gift_id = None
        if req['with_gift'] == 1:
            gift = Gift(req['full_name'], req['email'], req['address'])
            db.session.add(gift)
            db.session.commit()
            db.session.flush(gift)
            gift_id = gift.id

        project = ProjectModel.query.filter_by(id=req['project_id']).first()
        project.fund = project.fund + req['give_amount']
        db.session.add(project)

        transaction = TransferModel(req['project_id'], gift_id, req['give_amount'], req['payment_method'])
        db.session.add(transaction)
        db.session.commit()
        return {"message": "Item added successfully"}
