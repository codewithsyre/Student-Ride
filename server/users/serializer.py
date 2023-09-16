from django.contrib.auth.models import User
from rest_framework import serializers, validators

class RegisterSerializer(serializers.ModelSerializer):
    confirmPassword = serializers.CharField(write_only=True)

    class Meta:
        model = User
        fields = ('studentNumber', 'password', 'confirmPassword')

        extra_kwargs = {
            "password": {"write_only": True},
            "studentNumber": {
                "required": True,
                "validators": [
                    validators.UniqueValidator(
                        queryset=User.objects.all(),
                        message="Student number is already taken."
                    )
                ]
            }
        }

    def create(self, validated_data):
        studentNumber = validated_data.get('studentNumber')
        password = validated_data.get('password')
        confirmPassword = validated_data.get('confirmPassword')

        if password != confirmPassword:
            raise serializers.ValidationError("Passwords do not match.")

        user = User.objects.create_user(
            username=studentNumber,  # Use studentNumber as the username
            password=password,
            confirmPassword=confirmPassword,
        )

        return user
