<?php

function language_list(...$items): array
{
    return $items;
}

function add_to_language_list($language_list, $name): array
{
    $language_list[] = $name;
    return $language_list;
}

function prune_language_list($language_list): array
{
    array_shift($language_list);
    return $language_list;
}

function current_language($language_list): string
{
    return array_shift($language_list);
}

function language_list_length($language_list): int
{
    return count($language_list);
}