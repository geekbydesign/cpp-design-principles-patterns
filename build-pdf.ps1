$ErrorActionPreference = "Stop"

# ------------------------------------------------------------
# C++ Design Principles & Design Patterns PDF Builder
# Builds Chapters 01-09
# ------------------------------------------------------------

$RepoRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$BuildDir = Join-Path $RepoRoot "build"

$CombinedMd = Join-Path $BuildDir "cpp-design-principles-patterns-combined.md"
$PdfFile    = Join-Path $BuildDir "cpp-design-principles-patterns.pdf"
$MetadataFile = Join-Path $RepoRoot "metadata.yaml"

# ------------------------------------------------------------
# Check required tools
# ------------------------------------------------------------

if (-not (Get-Command pandoc -ErrorAction SilentlyContinue)) {
    throw "Pandoc was not found in PATH. Install Pandoc first."
}

if (-not (Get-Command xelatex -ErrorAction SilentlyContinue)) {
    throw "XeLaTeX was not found in PATH. Install a LaTeX distribution such as MiKTeX."
}

if (-not (Test-Path $MetadataFile)) {
    throw "metadata.yaml was not found."
}

# ------------------------------------------------------------
# Create build directory
# ------------------------------------------------------------

if (-not (Test-Path $BuildDir)) {
    New-Item -ItemType Directory -Path $BuildDir | Out-Null
}

# ------------------------------------------------------------
# Chapter titles
# ------------------------------------------------------------

$ChapterTitles = @{
    "01" = "SOLID Principles"
    "02" = "OOP Design Foundations"
    "03" = "Creational Patterns"
    "04" = "Structural Patterns"
    "05" = "Behavioral Patterns"
    "06" = "C++-Specific Design Techniques"
    "07" = "Pattern Comparisons"
    "08" = "Design Patterns in Real Systems"
    "09" = "Interview Preparation"
}

# ------------------------------------------------------------
# Find Chapters 01-09
# ------------------------------------------------------------

$ChapterDirs = Get-ChildItem -Path $RepoRoot -Directory |
    Where-Object {
        $_.Name -match '^0[1-9]-'
    } |
    Sort-Object Name

if ($ChapterDirs.Count -eq 0) {
    throw "No chapter directories were found."
}

Write-Host ""
Write-Host "Found $($ChapterDirs.Count) chapter directories."
Write-Host ""

# ------------------------------------------------------------
# Create UTF-8 without BOM writer
# ------------------------------------------------------------

$Utf8NoBom = New-Object System.Text.UTF8Encoding($false)

$Writer = New-Object System.IO.StreamWriter(
    $CombinedMd,
    $false,
    $Utf8NoBom
)

try {

    # --------------------------------------------------------
    # Add chapters
    # --------------------------------------------------------

    foreach ($ChapterDir in $ChapterDirs) {

        $ChapterNumber = $ChapterDir.Name.Substring(0, 2)

        if (-not $ChapterTitles.ContainsKey($ChapterNumber)) {
            Write-Warning "No title found for $($ChapterDir.Name). Skipping."
            continue
        }

        $Title = $ChapterTitles[$ChapterNumber]

        Write-Host "Processing Chapter $ChapterNumber - $Title"

        # Chapter heading
        $Writer.WriteLine("# Chapter $ChapterNumber - $Title")
        $Writer.WriteLine("")

        # Find Markdown files
        $MarkdownFiles = Get-ChildItem `
            -Path $ChapterDir.FullName `
            -Filter "*.md" `
            -File |
            Sort-Object Name

        foreach ($MarkdownFile in $MarkdownFiles) {

            Write-Host "   + $($MarkdownFile.Name)"

            # Read explicitly as UTF-8
            $Content = [System.IO.File]::ReadAllText(
                $MarkdownFile.FullName,
                [System.Text.Encoding]::UTF8
            )

            $Writer.WriteLine($Content)
            $Writer.WriteLine("")
            $Writer.WriteLine("")
        }

        # Page break between chapters
        $Writer.WriteLine("\newpage")
        $Writer.WriteLine("")
    }

}
finally {
    $Writer.Close()
}

# ------------------------------------------------------------
# Build PDF
# ------------------------------------------------------------

Write-Host ""
Write-Host "Building PDF..."
Write-Host ""

pandoc `
    $CombinedMd `
    "--from=markdown" `
    "--metadata-file=$MetadataFile" `
    "--pdf-engine=xelatex" `
    "--toc" `
    "--toc-depth=1" `
    "--number-sections=false" `
    "--syntax-highlighting=tango" `
    "-o" `
    $PdfFile

if (-not (Test-Path $PdfFile)) {
    throw "PDF generation failed."
}

Write-Host ""
Write-Host "=============================================="
Write-Host "PDF generated successfully!"
Write-Host "=============================================="
Write-Host ""
Write-Host "Combined Markdown:"
Write-Host $CombinedMd
Write-Host ""
Write-Host "PDF:"
Write-Host $PdfFile
Write-Host ""