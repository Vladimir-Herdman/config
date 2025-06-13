(function() {
    const { exec } = require('child_process');
    const filePath = app.vault.adapter.getFullPath(app.workspace.getActiveFile().path);
    const script = `open -n -a Alacritty --args -e /opt/homebrew/bin/nvim '${filePath}'`;

    exec(script, { env: process.env }, (error, stdout, stderr) => {
        if (error) {
            console.error("Error executing osascript:", error);
            return;
        }
    });
})();
