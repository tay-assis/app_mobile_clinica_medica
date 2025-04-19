$basePath = "lib/features/login"
$folders = @("controller", "model", "view")
foreach ($folder in $folders) {
    New-Item -ItemType Directory -Force -Path "$basePath/$folder"
}

New-Item -ItemType File -Force -Path "$basePath/controller/login_controller.dart"
New-Item -ItemType File -Force -Path "$basePath/model/usuario_model.dart"
New-Item -ItemType File -Force -Path "$basePath/view/login_page.dart"

Write-Host "Estrutura da feature 'login' criada com sucesso!"
