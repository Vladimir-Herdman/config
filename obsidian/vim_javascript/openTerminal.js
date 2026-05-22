(function() {
  const { exec } = require('child_process');
  let filepath = app.vault.adapter.getFullPath(app.workspace.getActiveFile().path);
  const script = `open -n -a Alacritty --args -e /opt/homebrew/bin/nvim "${filepath}"`;;

  const fixed_env = {
    ...process.env,
    PATH: [
      '/opt/homebrew/bin',
      '/opt/homebrew/sbin',
      process.env.PATH
    ].join(':')
  };

  exec(script, { env: fixed_env }, (error, stdout, stderr) => {
    if (error) {
      console.error("Error executing osascript:", error);
      return;
    }
  });
})();
