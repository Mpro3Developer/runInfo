''
 ' Classe para calculo de tempo de execucao e uso de memoria
 ' @author Matheus Castello
 ' http://mpro3.com.br
 ''

Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web

Public Class runInfo

    Public _start As Double
    Public _end As Double
    Private _elapsed_time As Double = 0.0
    Private _memo As Long
    Private ReadOnly jan1970 As DateTime = New DateTime(1970, 1, 1, 0, 0, 0, DateTimeKind.Utc)

    ''
    ' Construtor
    ''
    Public Sub New()
        Me._start = (DateTime.UtcNow - jan1970).TotalMilliseconds / 1000
    End Sub

    ''
    ' Ao terminar um processo chame para mostrar tempo </br>
    ' e memoria utilizada
    ''
    Public Function endRun() As String
        Me._end = (DateTime.UtcNow - jan1970).TotalMilliseconds / 1000
        Me._elapsed_time = Convert.ToDouble(Me._end - Me._start)
        Me._elapsed_time = Math.Round(Me._elapsed_time, 5)
        Me._memo = GC.GetTotalMemory(False)
        Return "Tempo utilizado: " & Me._elapsed_time & " secs. Uso de memória: " & Me._memo & " bytes"
    End Function

    ''
    ' Resgata valor do tempo decorrido do scritp em segundos
    ''
    Public Function getElapsedTime() As Double
        Return Me._elapsed_time
    End Function

    ''
    ' Resgata o gasto de memoria em bytes
    ''
    Public Function getMemory() As Long
        Return Me._memo
    End Function
End Class
