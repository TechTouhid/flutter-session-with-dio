from django.http.response import JsonResponse
from django.shortcuts import render
import json
# Create your views here.
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import AllowAny
from rest_framework.response import Response
from django.contrib.auth import authenticate, login, logout
from rest_framework.views import APIView
from rest_framework import status
from rest_framework.permissions import IsAuthenticated
from rest_framework.authentication import TokenAuthentication, SessionAuthentication, BasicAuthentication

class Hello(APIView):
    # permission_classes = [IsAuthenticated, ]
    # authentication_classes = [SessionAuthentication, BasicAuthentication]
    # authentication_classes = [TokenAuthentication, ]
    def post(self, request):
        # data = json.loads(request.body)
        username = request.data['username']
        password = request.data['password']
        print(username, password)
        if username is None or password is None:
            return JsonResponse({
                "errors": {
                    "__all__": "Please enter both username and password"
                }
            }, status=400)
        user = authenticate(username=username, password=password)
        if user is not None:
            login(request, user)
            # return JsonResponse({"detail": "Success"})
            return JsonResponse({"detail": request.session.session_key})
        return JsonResponse(
            {"detail": "Invalid credentials"},
            status=400,
        )
        # return JsonResponse({'status': 'done'})
        
class ExampleView(APIView):
    authentication_classes = [SessionAuthentication, BasicAuthentication]
    permission_classes = [IsAuthenticated]

    def get(self, request, format=None):
        content = {
            'user': str(request.user),  # `django.contrib.auth.User` instance.
            'auth': str(request.auth),  # None
        }
        return Response(content)
    
class Logout(APIView):
    def get(self, request, format=None):
        # using Django logout
        logout(request)
        return Response(status=status.HTTP_200_OK)    
    
class Say(APIView):
    def get(self, request):

        return Response({"api":"working"})