const fs = require('fs');
const path = require('path');
const express = require('express');
const app = express();
const port = 12345;
const workip = '192.168.1.2';

// Function to list all MP4 and picture files in a sub-directory
function listMediaFiles(directory, callback) {
  fs.readdir(directory, (err, files) => {
    if (err) {
      return callback(err, null);
    }

    // Filter files based on their extensions
    const mediaFiles = files.filter(file => {
      const ext = path.extname(file).toLowerCase();
      return ext === '.mp4' || ext === '.jpg' || ext === '.jpeg' || ext === '.png';
    });

    callback(null, mediaFiles);
  });
}

// Endpoint to get media files
app.get('/media', (req, res) => {
  const directoryPath = path.join(__dirname, './badjs');

  listMediaFiles(directoryPath, (err, mediaFiles) => {
    if (err) {
      return res.status(500).send('Unable to scan directory: ' + err);
    }

    // Generate HTML with hyperlinks to each media file
    let html = '<html><body><h1>Media Files</h1><ul>';
    mediaFiles.forEach(file => {
      html += `<li><a href="/media/${file}" target="_blank">${file}</a></li>`;
    });
    html += '</ul></body></html>';

    res.send(html);
  });
});

// Serve static files from the 'badjs' directory
app.use('/badjs', express.static(path.join(__dirname, 'badjs')));

// Dynamic route to serve media files
app.get('/media/:filename', (req, res) => {
  const directoryPath = path.join(__dirname, './badjs');
  const filePath = path.join(directoryPath, req.params.filename);
  res.sendFile(filePath, err => {
    if (err && !res.headersSent) {
      res.status(404).send('File not found');
    }
  });
});

app.listen(port, workip, () => {
  console.log(`Server is running at http://${workip}:${port}`);
});