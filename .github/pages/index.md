<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Latest Thesis PDFs</title>
<style>
    #pdf-container {
        display: block;
        text-align: center;
    }
    .pdf-viewer {
        width: 100%;
        max-width: 1000px;
    }
    object {
        width: 100%;
        height: 600px;
        border: 1px solid #ccc;
    }
</style>

</head>
<body>

    <div id="pdf-container">
        <p>Loading latest PDFs...</p>
    </div>

    <script>
        async function fetchLatestPDFs() {
            const username = "{{ site.github.owner_name }}";
            const reponame = "{{ site.github.repository_name }}";
            const repo = `${username}/${reponame}`;
            const apiUrl = `https://api.github.com/repos/${repo}/releases/latest`;

            try {
                const response = await fetch(apiUrl);
                const data = await response.json();

                if (!data.tag_name) {
                    throw new Error("Latest release not found");
                }

                const latestVersion = data.tag_name;
                const pdfNames = data.assets.map(element => element.name);

                const pdfContainer = document.getElementById("pdf-container");
                pdfContainer.innerHTML = ""; // Clear loading text

                pdfNames.forEach(pdf => {
                    const pdfUrl = `https://github.com/${repo}/releases/download/${latestVersion}/${pdf}`;

                    const pdfElement = `
                        <div class="pdf-viewer">
                            <h2>${pdf.replace(".pdf", "").charAt(0).toUpperCase() + String(val).slice(1)}</h2>
                            <object data="${pdfUrl}" type="application/pdf">
                                <embed src="${pdfUrl}">
                                    <p>This browser does not support PDFs.
                                    <a href="${pdfUrl}" target="_blank">Download PDF</a></p>
                                </embed>
                            </object>
                        </div>
                    `;

                    pdfContainer.innerHTML += pdfElement;
                });

            } catch (error) {
                document.getElementById("pdf-container").innerHTML = `<p>Error loading PDFs: ${error.message}</p>`;
            }
        }

        fetchLatestPDFs();
    </script>

</body>
</html>
