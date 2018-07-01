import Data.Tuple (swap)
import Data.List (sortBy)

data Dict a b = Empty | Node {left::Dict a b, right::Dict a b, key::a, value::b}

newDict = Empty

put Empty key value = Node {left = Empty, right = Empty, key = key, value = value}
put (Node l r k v) key value
  | key > k = Node l (put r key value) k v
  | key < k = Node (put l key value) r k v
  | otherwise = Node l r k value

get Empty key = Nothing
get (Node l r k v) key
  | key > k = get r key
  | key < k = get l key
  | key == k = Just v

getAllPairs Empty = []
getAllPairs (Node l r k v) = getAllPairs l ++ (k,v) : getAllPairs r

-- dado el diccionario, 'domain' devuelve la lista de (letr, frecuencia) ordenada
domain :: Dict Char Int -> [(Char, Int)]
domain = sortBy (\pair1 pair2 -> (swap pair1) `compare` (swap pair2)) . getAllPairs

-- pone todas las letras de la lista en el diccionario, actualizando la frecuencia
putAll :: Dict Char Int -> [Char] -> Dict Char Int
putAll dict [] = dict
putAll dict (c:rest) =
  case frec of
    Nothing -> putAll (put dict c 1) rest
    Just f -> putAll (put dict c (f + 1)) rest
  where frec = get dict c

-- 'count' es la función pedida, que toma la lista de letras, y devuelva una lista de 
-- (letra, frecuencia) ordenada
count list = domain . putAll newDict $ list

main = do
  let list = "cccaaeefdfefefafdbcbcbcbcffcdbcbfgcbcfdcefagbcggfgggfbdcefaebbf"
  print . count $ list