def call() {
  node() {

    sh 'env'

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
      stage('Compile Code') {
        if (appType == "maven") {
          sh 'mvn compile'
        }
        else {
          print 'Compile Not required'
        }
      }

      if(BRANCH_NAME != "main") {
        stage('Test Cases') {
          print 'Test Cases'
        }
      }

    }

  }
}