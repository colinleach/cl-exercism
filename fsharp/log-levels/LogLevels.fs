module LogLevels

let message (logLine: string): string = 
    let line = logLine.Trim()
    let stop = line.IndexOf("]: ")
    line.Substring(stop + 3).Trim()
       

let logLevel(logLine: string): string = 
    let start = logLine.IndexOf("[")
    let levelLength = logLine.IndexOf("]: ") - start - 1
    logLine.Substring(start + 1, levelLength).Trim().ToLower()

let reformat(logLine: string): string = $"{message logLine} ({logLevel logLine})"
