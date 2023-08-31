@Library('my-shared-lib') _

pipeline{

    agent any

    parameters{

        choice(name: 'action', choices: 'create\ndelete', description: 'Choose create/Destroy')
        string(name: 'ImageName', description: "name of the docker build", defaultValue: 'javapp')
        string(name: 'ImageTag', description: "tag of the docker build", defaultValue: 'v1')
        string(name: 'DockerHubUser', description: "name of the Application", defaultValue: 'ar7u4')
    }

    stages{
         
        stage('Git Checkout'){
                 //   when { expression {  params.action == 'create' } }
            steps{
            gitCheckout(
                branch: "main",
                url: "https://github.com/ar7u4/new-jenkins-shared-lib.git"
            )
            }
        }
         stage('Unit Test maven'){
         
        ///when { expression {  params.action == 'create' } }
        
            steps{
               script {
                    mvnTest()
                } 
                  
            }
        }
        stage('Integration Test maven'){
         
        // when { expression {  params.action == 'create' } }

            steps{
               script{
                    mvnIntegrationTest()
                }                   
            }
        }
        
        // stage('Static Code Analysis: Sonar'){
         
        // // when { expression {  params.action == 'create' } }

        //     steps{
        //        script{
        //             statiCodeAnalysis()
        //         }                   
        //     }
        // }
        // stage('Quality Gate Status Check : Sonarqube'){
        // //  when { expression {  params.action == 'create' } }
        //     steps{
        //        script{
                   
        //            def SonarQubecredentialsId = 'sonar-token-new'
        //            QualityGateStatus(SonarQubecredentialsId)
        //        }
        //     }
        // }
        stage('maven Build: maven'){
         
        // when { expression {  params.action == 'create' } }

            steps{
               script{
                    mvnBuild()
                }                   
            }
        }
        stage('Docker Image Build'){
         when { expression {  params.action == 'create' } }
            steps{
               script{
                   
                   dockerBuild("${params.ImageName}","${params.ImageTag}","${params.DockerHubUser}")
               }
            }
        }
        //  stage('Docker Image Scan: trivy '){
        //  when { expression {  params.action == 'create' } }
        //     steps{
        //        script{
                   
        //            dockerImageScan("${params.ImageName}","${params.ImageTag}","${params.DockerHubUser}")
        //        }
        //     }
        // }
        stage('Docker Image Push : DockerHub '){
         when { expression {  params.action == 'create' } }
            steps{
               script{
                   
                   dockerImagePush("${params.ImageName}","${params.ImageTag}","${params.DockerHubUser}")
               }
            }
        }   
        stage('Docker Image Cleanup : DockerHub '){
         when { expression {  params.action == 'create' } }
            steps{
               script{
                   
                   dockerImageCleanup("${params.ImageName}","${params.ImageTag}","${params.DockerHubUser}")
               }
            }
        }

    }

}