<div
    id="<?php echo e($toolbarId); ?>"
    class="toolbar btn-toolbar <?php echo e($cssClasses); ?>"
>
    <?php if(strlen($buttonsHtml)): ?>
        <div class="toolbar-action">
            <div class="progress-indicator-container">
                <?php echo $buttonsHtml; ?>

            </div>
        </div>
    <?php endif; ?>
</div>
<?php /**PATH /var/www/html/staging/app/admin/widgets/toolbar/toolbar.blade.php ENDPATH**/ ?>