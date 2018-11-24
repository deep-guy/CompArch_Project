Address is 32 bits
we are usingg 4 lines for block offset, since each block is 16 words
there are 256 blocks, so we need 8 lines for index bits
the remaining lines are 32 - (4 + 8) = 20 => These will be the tag bits.
The plan is to create a 256 * 16 array, with each entry in it being 32 bits wide.
We will also create a 1D array of size 256 to store the corresponding tag bits for every block
then we write a code that makes it function eactly like a DM cache
We dont need to worry about LRU. Apparently it is not required
We increment the hit count on every hit,
On miss, we change the tag bits, and make the block of words in the cache as the address we used.
Nothing else needs to be done other than this
After making a the module, we can modify it to take succesive inputs from a test file.
She has provided a test file with some 50000 enteries
We can use it to calculate an approximate hit and miss rate
Then we are done!! 
