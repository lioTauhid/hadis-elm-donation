from model.gift import Gift
from model.project import ProjectModel
from sqlalchemy.orm import relationship

from db import db


class TransferModel(db.Model):
    __tablename__ = 'transfer'
    id = db.Column('id', db.Integer, primary_key=True)
    project_id = db.Column('project_id', db.Integer, db.ForeignKey('project.id'))
    gift_id = db.Column('gift_id', db.Integer, db.ForeignKey('gift.id'))
    give_amount = db.Column('give_amount', db.Integer)
    payment_method = db.Column('payment_method', db.String(255))
    project = relationship(ProjectModel)
    gift = relationship(Gift)

    def __init__(self, project_id, gift_id, give_amount, payment_method):
        self.project_id = project_id
        self.gift_id = gift_id
        self.give_amount = give_amount
        self.payment_method = payment_method

    def to_json(self): return {
        "id": self.id,
        "project": self.project.name,
        "gift": {} if self.gift is None else self.gift.to_json(),
        "give_amount": self.give_amount,
        "payment_method": self.payment_method,
    }
