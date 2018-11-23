<template>
    <nav>
        <h1>MUS<span>CO</span></h1>
        <ul>
            <li><a href="">Accueil</a></li>
            <li><a href="">Annonces</a></li>
            <li><a href="">Connexion</a></li>
        </ul>
    </nav>
</template>

<script>
export default {
    name: 'MyNav'
}
</script>

<style scoped lang='scss'>
    nav {
        // display: flex;
        font-family: 'Shrikhand', cursive;
        width: 100%;
        height: 70px;
        background: black;
        position: fixed;

        h1 {
            font-size: 40px;
            color: #8833f8;
            line-height: 70px;
            margin-left: 50px;
            float: left;
            // justify-content: flex-start;
            span {
                color: #01dc0e
            }
        }

        ul {
            list-style: none;
            // justify-content: flex-end;
            float: right;
            
            li {
                width: 300px;
                height: 70px;
                text-align: center;
                border-left: solid 1px #8833f8;
                display: inline-block;
                line-height: 70px;
                // justify-content: space-around;
                a {
                    font-size: 20px;
                    text-decoration: none;
                    color: white;
                    &:hover {
                        color: #01dc0e;
                    }
                }
            }
        }
    }
</style>
