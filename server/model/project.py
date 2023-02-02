from db import db


class ProjectModel(db.Model):
    __tablename__ = 'project'
    id = db.Column('id', db.Integer, primary_key=True)
    name = db.Column('name', db.String(255))
    title = db.Column('title', db.String(255))
    description = db.Column('description', db.String(2000))
    need_amount = db.Column('need_amount', db.Integer)
    zakat = db.Column('zakat', db.String(255))
    fund = db.Column('fund', db.Integer)
    image_path = db.Column('image_path', db.String(255))

    def __init__(self, name, title, description, need_amount, zakat, fund, image_path):
        self.name = name
        self.title = title
        self.description = description
        self.need_amount = need_amount
        self.zakat = zakat
        self.fund = fund
        self.image_path = image_path

    def to_json(self): return {
        "id": self.id,
        "name": self.name,
        "title": self.title,
        "description": self.description,
        "need_amount": self.need_amount,
        "zakat": self.zakat,
        "fund": self.fund,
        "image_path": self.image_path,
    }
