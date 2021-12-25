from django.contrib.auth.base_user import AbstractBaseUser, BaseUserManager
from django.contrib.auth.models import PermissionsMixin

from django.db import models


class UserManager(BaseUserManager):
    def create_user(self, email, nickname, password, is_superuser):

        user = self.model(
            email=self.normalize_email(email),
            nickname=nickname,
            is_superuser=is_superuser,
        )
        user.set_password(password)
        user.save()

        return user

    def create_superuser(self, email, nickname, password):
        user = self.create_user(
            email, password=password, nickname=nickname, is_superuser=True
        )
        return user


class User(AbstractBaseUser, PermissionsMixin):
    nickname = models.CharField(max_length=12, unique=True)
    email = models.EmailField(
        verbose_name="email address",
        max_length=255,
        unique=True,
    )

    @property
    def username(self):
        return self.email

    @property
    def is_staff(self):
        return self.is_superuser

    USERNAME_FIELD = "email"
    REQUIRED_FIELDS = ["nickname"]
