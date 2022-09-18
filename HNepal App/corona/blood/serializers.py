from rest_framework import serializers
from .models import Blood

class BloodSerializer(serializers.ModelSerializer):
	class Meta:
		model = Blood
		fields = ('name', 'phone', 'blood_group', 'location','additional_info')
