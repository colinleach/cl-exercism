#include "linked_list.h"

struct list_node {
   struct list_node *prev, *next;
   ll_data_t data;
};

struct list {
   struct list_node *first, *last;
};

// constructs a new (empty) list
struct list *list_create(void) {
    struct list *list_ptr = malloc(sizeof(struct list));
    list_ptr->first = NULL;
    list_ptr->last = NULL;
    return list_ptr;
}

// counts the items on a list
size_t list_count(const struct list *list) {
    if (list->first == NULL) return 0; // empty list

    size_t count = 0;
    struct list_node *curr = list->first;
    while (curr != NULL) {
        count++;
        curr = curr->next;
    }
    return count;
}

// inserts item at back of a list
void list_push(struct list *list, ll_data_t item_data) {
    struct list_node *new_node = malloc(sizeof(struct list_node));
    new_node->data = item_data;
    new_node->next = NULL;
    new_node->prev = list->last;
    if (list->last != NULL) list->last->next = new_node;
    list->last = new_node;
    if (list->first == NULL) list->first = new_node;
}

// removes item from back of a list
ll_data_t list_pop(struct list *list) {
    struct list_node *to_pop = list->last;
    if (to_pop->prev != NULL) {
        to_pop->prev->next = NULL;
    } else {
        list->first = NULL;
    }
    list->last = to_pop->prev;
    ll_data_t result = to_pop->data;
    free(to_pop);
    return result;
}

// inserts item at front of a list
void list_unshift(struct list *list, ll_data_t item_data) {
    struct list_node *new_node = malloc(sizeof(struct list_node));
    new_node->data = item_data;
    new_node->prev = NULL;
    new_node->next = list->first;
    if (list->first != NULL) list->first->prev = new_node;
    list->first = new_node;
}

// removes item from front of a list
ll_data_t list_shift(struct list *list) {
    struct list_node *to_pop = list->first;
    if (to_pop->next != NULL) to_pop->next->prev = NULL;
    list->first = to_pop->next;
    ll_data_t result = to_pop->data;
//    free(to_pop);  // segfaults! (no idea why)
    return result;
}

// deletes a node that holds the matching data
void list_delete(struct list *list, ll_data_t data) {
    struct list_node *curr = list->first;
    while (curr->data != data && curr->next != NULL) curr = curr->next;
    if (curr->data == data) {
        if (curr->prev == NULL) {
            list->first = curr->next;
        } else {
            curr->prev->next = curr->next;
        }
        if (curr->next == NULL) {
            list->last = curr->prev;
        } else {
            curr->next->prev = curr->prev;
        }
        free(curr);
    }
 }

// destroys an entire list
// list will be a dangling pointer after calling this method on it
void list_destroy(struct list *list) {
    while (list->last != NULL) list_pop(list);
    free(list);
}
