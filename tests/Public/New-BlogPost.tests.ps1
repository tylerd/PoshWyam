Import-Module "$Artifacts\PoshWyam\PoshWyam.psd1" -Force

Describe "New-BlogPost" {

    BeforeAll {
        [void](New-Item -Path "TestDrive:\config.wyam" -ItemType File)
        [void](New-Item -Path "TestDrive:\input\posts" -ItemType Directory)

        Push-Location "TestDrive:\"
    }

    AfterAll {
        Pop-Location
    }

    Context "With -Title" {
        It "runs without error" {

            $before = (Get-ChildItem "TestDrive:\input\posts").Count
            New-BlogPost -Title "test post"

            (Get-ChildItem "TestDrive:\input\posts").Count | Should be ($before + 1)

        }
    }

}