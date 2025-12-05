pipeline {
    agent {
        label 'AGENT-1'
    }
    environment {
        appVersion = ''
    }

    options {
        timeout(time: 30, unit: "MINUTES")
        disableConcurrentBuilds()
    }
    // parameters {
    //     string(name: 'PERSON', defaultValue: 'Mr Jenkins', description: 'Who should I say hello to?')

    //     text(name: 'BIOGRAPHY', defaultValue: '', description: 'Enter some information about the person')

    //     booleanParam(name: 'TOGGLE', defaultValue: true, description: 'Toggle this value')

    //     choice(name: 'CHOICE', choices: ['One', 'Two', 'Three'], description: 'Pick something')

    //     password(name: 'PASSWORD', defaultValue: 'SECRET', description: 'Enter a password')
    // }
    stages {
        stage('Read Version') {
            steps {
                script {
                    def packageJson = readJSON file: 'package.json'
                    appVersion = packageJson.version
                    echo "Package Version: ${appVersion}"
                }
            }
        }

        stage('install dependencies') {
            steps {
                script {
                    sh """
                        npm install
                    """
                }
            }
        }
    }
    
    post {
        always {
            echo 'always'
            deleteDir()
        }
        success {
            echo 'success'
        }

    }

}