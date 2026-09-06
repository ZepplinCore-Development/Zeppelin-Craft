-- =============================================================================
-- F-208  zep_edit_journal
--
-- The in-game spawn editor (modules/mod-gobject-editor) records every edit here.
-- `zep world edits emit` drains it into a tagged, idempotent zpak SQL file.
--
-- The worldserver container mounts only env/dist/etc, env/dist/logs and the
-- read-only client data volume (docker-compose.yml), so the module cannot write
-- a .sql file itself. This table is the hand-off between the two.
--
-- One row per CHANGED COLUMN, not per save: `old_value` records what the row
-- held before the edit, which is the relational form of F-203's base hash, so an
-- emitted UPDATE can assert what it expected to find.
--
-- WARNING: a full world rebuild drops and recreates this table. Drain pending
-- edits (`zep world edits list --pending`) before rebuilding.
-- =============================================================================

CREATE TABLE IF NOT EXISTS `zep_edit_journal` (
  `id`             INT UNSIGNED    NOT NULL AUTO_INCREMENT,
  `task_id`        VARCHAR(16)     NOT NULL DEFAULT ''   COMMENT 'F-xxx / I-xxx this edit belongs to',
  `op`             ENUM('update','insert','delete') NOT NULL DEFAULT 'update',
  `table_name`     VARCHAR(64)     NOT NULL             COMMENT 'gameobject | creature',
  `pk_name`        VARCHAR(64)     NOT NULL DEFAULT 'guid',
  `pk_value`       INT UNSIGNED    NOT NULL,
  `column_name`    VARCHAR(64)     NOT NULL             COMMENT '* for whole-row insert/delete',
  `old_value`      VARCHAR(255)    NOT NULL DEFAULT '',
  `new_value`      VARCHAR(255)    NOT NULL DEFAULT '',
  `account_id`     INT UNSIGNED    NOT NULL DEFAULT 0,
  `character_name` VARCHAR(48)     NOT NULL DEFAULT '',
  `created_at`     TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `emitted_at`     TIMESTAMP       NULL     DEFAULT NULL COMMENT 'NULL = not yet written to a zpak SQL file',
  `emitted_file`   VARCHAR(255)    NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_task`    (`task_id`, `emitted_at`),
  KEY `idx_target`  (`table_name`, `pk_value`),
  KEY `idx_pending` (`emitted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
  COMMENT='F-208 in-game spawn editor journal; drained by `zep world edits emit`';
