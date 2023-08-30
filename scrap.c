// 20- 30 lines
/**
 * free all pages that belong to the process (setr refcoount to 0, owner = FREE) --> loop over pageinfo[] (assign_next_free_physical_page)
 * decrement the refcount (read only pages) that this process can access
 * 
 * 
*/