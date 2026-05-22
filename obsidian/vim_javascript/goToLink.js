(function() {
  const editor = app.workspace.activeEditor?.editor;
  if (!editor) return;

  const cursor = editor.getCursor();
  const [ogline, ogch] = [cursor.line, cursor.ch];
  const line = editor.getLine(cursor.line);

  const linkmatch = line.match(/\[\[|\[.*?\]\(/);
  if (!linkmatch) return;

  editor.setCursor({line:cursor.line, ch:linkmatch.index+1});
  app.commands.executeCommandById('editor:follow-link');
  editor.setCursor({line:ogline, ch:ogch});
  //console.log(`Called open link on:${linkmatch}`);
})();
