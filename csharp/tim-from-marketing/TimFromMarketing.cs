using System;

static class Badge
{
    public static string Print(int? id, string name, string? department)
    {
        var dept = (department ?? "OWNER").ToUpper();
        return id == null ? $"{name} - {dept}" : $"[{id}] - {name} - {dept}";
    }
}
