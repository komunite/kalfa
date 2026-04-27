#!/bin/bash
# Pre-clear validation: ensures DailyNotes handoff exists before /clear proceeds.
# Called by clear.md Step 0 and can be used as a standalone check.

DAILY_NOTE="$CLAUDE_PROJECT_DIR/.claude/workspace/DailyNotes/$(date +"%m%d%y").md"

if [ ! -f "$DAILY_NOTE" ]; then
  echo "BLOCK: Günlük not dosyası bulunamadı: $DAILY_NOTE"
  echo "Önce oturum devri yazılmalı."
  exit 1
fi

if ! grep -q "^## Oturum Devri" "$DAILY_NOTE" 2>/dev/null; then
  echo "BLOCK: /clear çalıştırılamaz — günlük nota oturum devri yazılmadı."
  echo "Dosya: $DAILY_NOTE"
  echo "Beklenen bölüm: '## Oturum Devri'"
  exit 1
fi

exit 0
