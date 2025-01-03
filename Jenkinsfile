pipeline {
    agent any
    stages {
        stage('stage01- clone the code') {
            steps {
                git 'https://github.com/amitkumar0441/Docker-Jenkins-Project.git'
            }
        }
        stage('stage02- build the docker image') {
            steps {
                sh 'docker build -t amitkumar0441/centoshttpdserver:v1 . '
            }
        }
    }
}