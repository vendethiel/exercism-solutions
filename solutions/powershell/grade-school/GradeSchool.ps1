class Student {
    [int]$Grade
    [string]$Name
    Student([int]$Grade, [string]$Name) {
        $this.Grade = $Grade
        $this.Name = $Name
    }
}

class Roster {
    [Student[]]$Students

    [Student[]]GetRoster([int]$n) {
        return $this.Students | Where-Object {$_.Grade -eq $n} | Sort-Object -Property Name
    }

    [Student[]]GetRoster() {
        return $this.Students | Sort-Object -Property Grade, Name
    }

    [bool]AddStudent([int]$g,[string]$name) {
        if ($this.Students | Where-Object {$_.Name -eq $name}) {
            return $false
        }
        $this.Students += [Student]::new($g, $name)
        return $true
    }
}