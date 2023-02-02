from db import db


class Gift(db.Model):
    __tablename__ = 'gift'
    id = db.Column('id', db.Integer, primary_key=True)
    full_name = db.Column('full_name', db.String(255))
    email = db.Column('email', db.String(255))
    address = db.Column('address', db.String(255))

    def __init__(self, full_name, email, address):
        self.full_name = full_name
        self.email = email
        self.address = address

    def to_json(self): return {
        "id": self.id,
        "full_name": self.full_name,
        "email": self.email,
        "address": self.address,
    }
