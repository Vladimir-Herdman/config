(function() {
    const cursor = editor.getCursor();
    const currentText = editor.getLine(cursor.line);
    const aboveText = editor.getLine(cursor.line-1);
    editor.replaceRange("", {line: cursor.line, ch: 0}, {line: cursor.line, ch: Infinity});
    editor.replaceRange("", {line: cursor.line-1, ch: 0}, {line: cursor.line-1, ch: Infinity});
    editor.replaceRange(currentText, {line: cursor.line-1, ch: 0});
    editor.replaceRange(aboveText, {line: cursor.line, ch: 0});
    editor.setCursor({line: cursor.line-1, ch: cursor.ch});
})();
