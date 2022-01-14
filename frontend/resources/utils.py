from faker import Faker
faker = Faker()


def screenshot_name():
    return faker.sha1()