pipeline {
    agent { docker { image 'danielgomeza/ant-repo:latest' } }

    stages {
        stage('ant version') {
            steps {
                sh 'ant -version'
            }
        }
            stage('ant build salesforce') {
            steps {
                git 'https://github.com/danielitogomez/salesforce_ant_example'
                //sh 'echo lala dummy'
                sh 'ls'
                //sh 'ant undeployCode'
                //sh 'ant deployCode'
            }
        }
    }
}
