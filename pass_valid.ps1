$Input = Read-Host "Please enter your password"
if($input.length -ge 10)
{
    if($input -match '\d')
    {
        if($input -cmatch '[a-z]')
        {
            if($input -cmatch '[A-Z]')
            {
                Write-Host "Password is strong" -ForegroundColor Green
            }
            else
            {
                Write-Host "There must be at least ona capital letter in the password" -ForegroundColor red
            }
        }
        else
        {
            Write-Host "There must be at least one lower letter in the password" -ForegroundColor red
        }
    }
    else
    {
        Write-Host "There must be at least one number in the password" -ForegroundColor red
    }
}
else
{
    Write-Host "There are less then 10 digits in the password" -ForegroundColor red
}