def call() {
  node() {

//    sh 'env'

    stage('Code Checkout') {

      sh 'find . | grep "^./" |xargs rm -rf'

      if (env.TAG_NAME ==~ ".*") {
        env.gitbrname = "refs/tags/${env.TAG_NAME}"
      } else {
        env.gitbrname = "${env.BRANCH_NAME}"
      }
      checkout poll: false, scm: [
          $class: 'GitSCM',
          userRemoteConfigs: [
              [
                  url: "https://github.com/raghudevopsb80/${env.appName}"
              ]
          ],
          branches: [
              [
                  name: gitbrname
              ]
          ]
      ]

    }

    if (env.TAG_NAME) {
      stage('Docker Build') {
        print 'Docker Build'
      }

      stage('Docker Push') {
        print 'Docker Push'
      }

      stage('Deploy to Dev') {
        print 'Deploy to Dev'
      }
    }
    else {

      // This stage is particularly not needed now, It would come later, we will enable later.

//      stage('Compile Code') {
//        if (appType == "maven") {
//          sh 'mvn compile'
//        }
//        else {
//          print 'Compile Not required'
//        }
//      }

      // Time being we commented this. Later we will enable it back.
      //if(BRANCH_NAME != "main") {

        stage('Unit Test Cases') {

          if (appType == "nodejs") {
            //sh 'npm run test'
            print '#npm run test'
          }

          if (appType == "python") {
            //sh 'python -m unittest'
            print '#python -m unittest'
          }

          if (appType == "maven") {
            //sh 'mvn test'
            print '#mvn test'
          }

        }

        stage('Integration Test Cases') {
          if (appType == "nodejs") {
            //sh 'npm run integration-test'
            print '#npm run integration-test'
          }

          if (appType == "python") {
            //sh 'python -m unittest discover -s project/tests/integration'
            print '#python -m unittest discover -s project/tests/integration'
          }

          if (appType == "maven") {
            //sh 'mvn test'
            print '#mvn integration-test'
          }
        }

        stage('Regression Test Cases') {
          // Developer will provide appropriate steps to execute.
          print 'Test Cases'
        }

      }

    //}

  }
}