#!/bin/bash
# 根據你的系統路徑修改為 BAT1
BAT_PATH="/sys/class/power_supply/BAT1"
THRESHOLD=15

while true; do
    if [ -d "$BAT_PATH" ]; then
        BAT_LEVEL=$(cat "$BAT_PATH/capacity")
        BAT_STATUS=$(cat "$BAT_PATH/status")

        # 當電量低於閾值且處於「放電」狀態時發送通知
        if [ "$BAT_LEVEL" -le "$THRESHOLD" ] && [ "$BAT_STATUS" = "Discharging" ]; then
            notify-send -u critical "🔋 低電量警告" "目前電量僅剩 ${BAT_LEVEL}%，請連接電源。"
        fi
    fi
    sleep 15
done
