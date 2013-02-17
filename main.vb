Module main

    Sub Main()
        Dim run As runInfo = New runInfo()
        For I = 0 To 50000
            Console.Out.WriteLine("Printa")
        Next
        Console.Out.WriteLine(run.endRun())
        Console.ReadKey()
    End Sub

End Module
