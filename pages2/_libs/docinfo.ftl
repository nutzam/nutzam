<div class="doc-info">
    <#if doc.lm??>
        <div class="doc-lm">${doc.lm?datetime}</div>
    </#if>
    <#if doc.tags??>
        <div class="doc-tags">
            <#list doc.tags as lb>
            <a href="${page.bpath}tags/${lb.key}.html">${lb.text}</a>
            </#list>
        </div>
    </#if>
    <#if doc.verifiers??>
        <div class="doc-au doc-verifiers">
            <#if (doc.verifiers?size)&gt;0><i>校验:</i></#if>
            <#list doc.verifiers as au>
            <span class="doc-aui doc-verif">
                <#if (au.email)??>
                    <a href="mailto:${au.email}">${au.name}</a>
                <#else>
                    <b>${au.name}</b>
                </#if>
            </span>
            </#list>
        </div>
    </#if>
    <#if doc.authors??>
        <div class="doc-au doc-authors">
            <#if (doc.authors?size)&gt;0><i>作者:</i></#if>
            <#list doc.authors as au>
            <span class="doc-aui doc-author">
                <#if (au.email)??>
                    <a href="mailto:${au.email}">${au.name}</a>
                <#else>
                    <b>${au.name}</b>
                </#if>
            </span>
            </#list>
        </div>
    </#if>
</div>
