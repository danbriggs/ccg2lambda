echo "infilename(.txt): $1"
echo "outfilename(.html): $2"
cat $1
cat $1 | sed -f en/tokenizer.sed > en/sentences.tok
/home/daniel/Desktop/Alex/learningbyreading/ext/candc/bin/candc --models /home/daniel/Desktop/Alex/learningbyreading/ext/candc/models --candc-printer xml --input en/sentences.tok > en/sentences.candc.xml
python3 en/candc2transccg.py en/sentences.candc.xml > en/sentences.xml
python3 scripts/semparse.py en/sentences.xml en/semantic_templates_en_emnlp2015.yaml en/sentences.sem.xml
python3 scripts/prove.py en/sentences.sem.xml --graph_out $2
