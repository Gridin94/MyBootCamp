#This script is validating a password strength:
#Password must have at least 10 digits, 
#must include numbers,Capital and lower letters.
#Password can be provided in command line or from
#a file if -f is added and a path is provided.

#Get password
Write-Host "Password verification starts..."

#Check if -f exist in command line - if yes read from file, else get password from command line
if($args[0] -cmatch "-f")
{
    $path = $args[1]
    #Check if file exist
    if(-not(Test-Path -Path $path -PathType Leaf))
    {
        Write-Host "The file doesn't exist" -ForegroundColor Red
        exit 1
    }
    else 
    {
        #Read file content
        $pass = Get-Content $path
    }
}
else 
{
    #Get password from command line
    $pass = $args[0]  
}

#Check if password has at least 10 digits
if($pass.length -ge 10)
{
    #Check if password has numbers
    if($pass -match '\d')
    {
        #Check if password has lower letter
        if($pass -cmatch '[a-z]')
        {
            #Check if password has capital letter
            if($pass -cmatch '[A-Z]')
            {
                Write-Host "Password is strong" -ForegroundColor Green
                exit 0
            }
            else
            {
                Write-Host "There must be at least ona capital letter in the password" -ForegroundColor Red
                exit 1
            }
        }
        else
        {
            Write-Host "There must be at least one lower letter in the password" -ForegroundColor Red
            exit 1
        }
    }
    else
    {
        Write-Host "There must be at least one number in the password" -ForegroundColor Red
        exit 1
    }
}
else
{
    Write-Host "There are less then 10 digits in the password" -ForegroundColor Red
    exit 1
}