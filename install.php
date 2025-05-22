<?php
$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "language`");

if ($query->num_rows && !isset($query->row['url'])) {
    $this->db->query("ALTER TABLE `" . DB_PREFIX . "language` ADD `url` VARCHAR(32) NOT NULL AFTER `code`");
}
?>