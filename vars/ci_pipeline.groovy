def call() {
  node() {

//    sh 'env'

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
            sh 'npm run test'
          }
          print 'Test Cases'
        }

        stage('Integration Test Cases') {
          print 'Test Cases'
        }

        stage('Regression Test Cases') {
          print 'Test Cases'
        }

      }

    //}

  }
}