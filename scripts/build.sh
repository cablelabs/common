
echo $CI_BRANCH

if [ "$CI_BRANCH" == "master" ]; then

    git --version

    git checkout master

    ./deploy.sh

    cd ..

    ls -la

    git config --global user.email "santhosh.mk@gmail.com"
    git config --global user.name "Santhosh Kulasekar"

    git fetch origin gh-pages:gh-pages

    git checkout gh-pages

    git merge -m "Merge from remote" FETCH_HEAD

    ls -la

    cp swagger-file.json swagger/api-docs/swagger-file.json


    # Check if the swagger file has changed before checking it in


    # Adding swagger/api-docs/swagger-file.json
    git add -f swagger/api-docs/swagger-file.json

    git commit -m "Pushed swagger-file.json into api-docs folder."

    git push origin gh-pages
else
    echo "No performing Test on this branch!"
fi