def call() {
    sh "echo Hello World"
}




/*
def call (Map config = [:]) {
    sh "echo Hello ${config.name}, Today is ${config.dayOfWeek}"
}


*/



/*

def call(String name, String dayOfWeek) {
    sh "echo Hello ${name}, Today is ${dayOfWeek}"
}

*/

/*
# PIPELINE CODE
@Library("name-of-shared-lib-config") _ 
pipeline {
    agent { lable "linux"}
    stages{
        stage('Example') {
            steps {
                helloWorld()    # Name of file in jenkins library
            }
        }
    }
}
*/