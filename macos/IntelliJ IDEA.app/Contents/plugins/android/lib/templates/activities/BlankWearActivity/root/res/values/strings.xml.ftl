<resources>
    <#if !isNewModule>
    <string name="title_${activityToLayout(activityClass)}">${escapeXmlString(activityClass)}</string>
    </#if>
    <!--
    This string is used for square devices and overridden by hello_world in
    values-round/strings.xml for round devices.
    -->
    <string name="hello_world">Hello Square World!</string>
</resources>